contract TestSliceGetter {
    get fun getSlice(): Slice {
        return beginCell().storeUint(123, 7).endCell().asSlice();
    }
    
    receive() {}
}
