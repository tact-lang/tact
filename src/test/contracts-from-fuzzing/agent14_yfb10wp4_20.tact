contract TestCellToSlice {
    receive() {
         let c = beginCell().storeUint(42, 8).endCell();
         dump(c.asSlice());
    }
}
