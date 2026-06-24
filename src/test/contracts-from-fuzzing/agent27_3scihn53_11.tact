fun testHasSameBasechain() : Bool {
    let code: Cell = emptyCell();
    let data: Cell = emptyCell();
    let state: StateInit = StateInit { code, data };
    let a: Address = address("UQDpXLZKrkHsOuE_C1aS69C697wE568vTnqSeRfBXZfvmVOo");
    return state.hasSameBasechainAddress(a);
}
