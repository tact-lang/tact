contract ExampleComptime {
    // Valid address encoding from docs
    addr: Address = address("EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N");
    
    storedCell: Cell = cell("te6cckEBAQEAYgAAwP8AIN0gggFMl7qXMO1E0NcLH+Ck8mCDCNcYINMf0x/TH/gjE7vyY+1E0NMf0x/T/9FRMrryoVFEuvKiBPkBVBBV+RDyo/gAkyDXSpbTB9QC+wDo0QGkyMsfyx/L/8ntVD++buA=");
    storedSlice: Slice = slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=");
    raw: Slice = rawSlice("4a");

    get fun getAddress(): Address {
         return self.addr;
    }

    get fun getCell(): Cell {
         return self.storedCell;
    }

    get fun getSlice(): Slice {
         return self.storedSlice;
    }

    get fun getRaw(): Slice {
         return self.raw;
    }
}
