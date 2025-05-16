struct FlatStruct {
    A: Int;
    B: Int;
    C: Int;
    D: Int;
    E: Int;
    F: Int;
    G: Int;
    H: Int;
    I: Int;
    J: Int;
    K: Int;
    L: Int;
    M: Int;
    N: Int;
    O: Int;
}

contract TestFlatStruct {
    receive() {
        let s = FlatStruct { A: 1, B: 2, C: 3, D: 4, E: 5, F: 6, G: 7, H: 8, I: 9, J: 10, K: 11, L: 12, M: 13, N: 14, O: 15 };
        let x = s.O;
        dump(x);
    }
}
