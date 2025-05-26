contract ComparisonsTester {
    sliceCounter: Int = 0;
    cellCounter: Int = 0;

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

    get fun compare1(x: Int): Bool {
        return x == x.incOld()
    }

    get fun compare2(): Bool {
        return self.leftSlice() == self.rightSlice();
    }

    get fun compare3(): Bool {
        return self.leftCell() == self.rightCell();
    }
}

extends mutates fun incOld(self: Int): Int { self += 1; return self - 1 }
