struct ByteConvert {
    a: Int;
}

contract TestCellSlice {
    receive() {
        let b: ByteConvert = ByteConvert { a: 77 };
        let cell = b.toCell();
        let slice = cell.asSlice();
        let b2: ByteConvert = ByteConvert.fromSlice(slice);
        dump(b2.a);
    }
}
