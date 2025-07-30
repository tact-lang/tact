fun testAsSlice() : Bool {
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    let slice1: Slice = beginCell().storeAddress(a).asSlice();
    let slice2: Slice = a.asSlice();
    return slice1 == slice2;
}

// A minimal main function to trigger compilation
fun main() {
    testAsSlice();
    return;
}
