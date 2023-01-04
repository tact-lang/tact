contract DDDD {
    addr1: Address;
    addr2: Address;
    addr3: Address;

    mapData: map[Int]Address;
    mapData2: map[Address]Int;

    init( addr1: Address, addr2: Address, addr3: Address) {
        self.addr1 = addr1;
        self.addr2 = addr2;
        self.addr3 = addr3;
    }

    receive() {
        //YYYYYY
        self.mapData.set(0, self.addr1);
        self.mapData.set(1, self.addr2);
        self.mapData.set(2, self.addr3);
        self.mapData.set(3, self.addr1); // OK

        self.mapData2.set(self.addr1, 0);
        self.mapData2.set(self.addr2, 1);
        self.mapData2.set(self.addr3, 2);
        self.mapData2.set(self.addr1, 3); // Failed
    }

    get fun mapData_addr1(key: Int): Address? {
        return self.mapData.get(key);
    }

    get fun mapData2_addr1(key: Address): Int? {
        return self.mapData2.get(key);
    }
}