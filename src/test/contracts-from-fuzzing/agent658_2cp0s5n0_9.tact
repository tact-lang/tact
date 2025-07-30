struct LongStruct {
    alpha: Int;
    beta: Bool;
    gamma: String;
    delta: Int?;
    epsilon: Bool?;
    zeta: String?;
    eta: Address;
    theta: Address?;
    iota: Cell;
    kappa: Cell?;
    lambda: Slice;
    mu: Slice?;
    nu: Int;
    xi: Int?;
    omicron: Bool;
    pi: Bool?;
    rho: String;
    sigma: String?;
    tau: Address;
    upsilon: Address?;
}

contract VeryLong {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            alpha: 1,
            beta: true,
            gamma: "hello",
            delta: null,
            epsilon: null,
            zeta: null,
            eta: myAddress(),
            theta: null,
            iota: emptyCell(),
            kappa: null,
            lambda: emptyCell().asSlice(),
            mu: null,
            nu: 2,
            xi: null,
            omicron: false,
            pi: null,
            rho: "world",
            sigma: null,
            tau: myAddress(),
            upsilon: null
        };
    }
}