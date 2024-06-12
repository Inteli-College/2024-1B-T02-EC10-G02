from prisma import Prisma
from contextlib import asynccontextmanager
from __init__ import db


class PyxisService():
    def __init__(self, id=None, name=None, reference=None, sector=None, ala=None, floor=None, items=None):
        self.id = id
        self.name = name
        self.reference = reference
        self.sector = sector
        self.ala = ala
        self.floor = floor
        self.items = items

    @asynccontextmanager
    async def database_connection(self):
        self.db = db
        await self.db.connect()
        try:
            yield
        finally:
            await self.db.disconnect()

    async def create(self):
        async with self.database_connection():
            try:

                pyxis = await self.db.pyxis.create(
                    data={
                        "name": self.name,
                        "reference": self.reference,
                        "sector": self.sector,
                        "ala": self.ala,
                        "floor": self.floor,
                        "items": {
                            "connect": [{
                                "id": itemId
                            } for itemId in self.items]
                        }
                    }
                )
                return pyxis
            except Exception as e:
                raise e

    async def relate_item(self):
        async with self.database_connection():
            pass

    async def update_item(self):
        async with self.database_connection():
            try:
                pyxi - await self.db.pyxis.find_unique_or_raise(

                )
                pyxi = await self.db.pyxis.update(
                    where={
                        "id": self.id,
                    },
                    data={
                        "name": self.name,
                        "reference": self.reference,
                        "sector": self.sector,
                        "ala": self.ala,
                        "floor": self.floor,
                        "item": self.items
                    }
                )
                return pyxi
            except Exception as e:
                raise e
