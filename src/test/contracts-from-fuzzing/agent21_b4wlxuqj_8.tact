contract TestSlice {
    receive() {}
    
    get fun get_slice(): Slice {
        return beginCell().asSlice();
    }
}
