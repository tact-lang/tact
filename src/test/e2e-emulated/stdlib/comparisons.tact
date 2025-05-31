contract ComparisonsTester {
    sliceCounter: Int = 0;
    sliceOptCounter: Int = 0;
    cellCounter: Int = 0;
    cellOptCounter: Int = 0;

    receive() {}

    fun leftSlice(): Slice {
        self.sliceCounter += 1;
        return emptySlice()
    }

    fun rightSlice(): Slice {
        if (self.sliceCounter == 0) {
            return beginCell().storeUint(10, 32).endCell().asSlice()
        }
        return emptySlice()
    }

    fun leftOptSlice(): Slice? {
        self.sliceOptCounter += 1;
        return emptySlice()
    }

    fun rightSliceForLeftOpt(): Slice {
        if (self.sliceOptCounter == 0) {
            return beginCell().storeUint(10, 32).endCell().asSlice()
        }
        return emptySlice()
    }

    fun leftCell(): Cell {
        self.cellCounter += 1;
        return emptyCell()
    }

    fun rightCell(): Cell {
        if (self.cellCounter == 0) {
            return beginCell().storeUint(10, 32).endCell()
        }
        return emptyCell()
    }

    fun leftOptCell(): Cell? {
        self.cellOptCounter += 1;
        return emptyCell()
    }

    fun rightCellForOptLeft(): Cell {
        if (self.cellOptCounter == 0) {
            return beginCell().storeUint(10, 32).endCell()
        }
        return emptyCell()
    }

    get fun compare1(x: Int): Bool {
        return x == x.incOld()
    }

    get fun compare2(): Bool {
        return self.leftSlice() == self.rightSlice();
    }

    get fun compare3(): Bool {
        return self.leftCell() == self.rightCell();
    }

    get fun compare4(x: Int): Bool {
        return x == x.incOptOld()
    }

    get fun compare5(): Bool {
        return self.leftOptSlice() == self.rightSliceForLeftOpt();
    }

    get fun compare6(): Bool {
        return self.leftOptCell() == self.rightCellForOptLeft();
    }

    get fun compare7(x: Int?): Bool {
        return x == x.incOpt2Old()
    }
}

extends mutates fun incOld(self: Int): Int { self += 1; return self - 1 }
extends mutates fun incOptOld(self: Int): Int? { self += 1; return self - 1 }
extends mutates fun incOpt2Old(self: Int?): Int { self = self!! + 1; return self!! - 1 }
