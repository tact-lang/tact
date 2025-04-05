struct Flat {
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
    P: Int;
    Q: Int;
    R: Int;
    S: Int;
    T: Int;
}

contract TestFlat {
    receive() {
        let f = Flat{
            A: 1, B: 2, C: 3, D: 4, E: 5, F: 6, G: 7, H: 8, I: 9, J: 10,
            K: 11, L: 12, M: 13, N: 14, O: 15, P: 16, Q: 17, R: 18, S: 19, T: 20
        };
        f.A + f.B + f.C + f.D + f.E + f.F + f.G + f.H + f.I + f.J +
        f.K + f.L + f.M + f.N + f.O + f.P + f.Q + f.R + f.S + f.T;
    }
}
