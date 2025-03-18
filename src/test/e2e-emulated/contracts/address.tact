contract AddressTester() {
    receive() { }

    get fun test1(): Address {
        return address("UQBKgXCNLPexWhs2L79kiARR1phGH1LwXxRbNsCFF9doczSI");
    }

    get fun test2(): Address {
        return address("EQBKgXCNLPexWhs2L79kiARR1phGH1LwXxRbNsCFF9doc2lN");
    }

    get fun test3(): Address {
        return address("0:4a81708d2cf7b15a1b362fbf64880451d698461f52f05f145b36c08517d76873");
    }

    get fun basechainAddressFromHash(hash: Int?): BasechainAddress {
        return BasechainAddress{ hash };
    }

    get fun basechainAddressStore(ba: BasechainAddress): Cell {
        return beginCell()
            .storeBasechainAddress(ba)
            .endCell();
    }

    get fun basechainAddressLoad(baCell: Slice): BasechainAddress {
        let ba = baCell.loadBasechainAddress();
        baCell.endParse(); // make sure it's empty
        return ba;
    }

    get fun basechainAddressSkip(baCell: Slice): Bool {
        baCell.skipBasechainAddress();
        baCell.endParse(); // make sure it's empty
        return true;
    }
}
