struct LongNamesAndManyFields {
    alpha: Int;
    beta: Int;
    gamma: Bool;
    delta: String;
    epsilon: Bool;
    zeta: Int?;
    eta: String;
    theta: Bool;
    iota: String;
    kappa: Int;
    lambda: Bool;
    mu: Int;
    nu: Int;
    xi: Bool;
    omicron: Int;
    pi: Int;
    rho: String;
    sigma: Bool;
    tau: Int?;
    upsilon: Bool;
    phi: Bool;
    chi: String;
    psi: Bool;
    omega: String;
}

contract TestContract {
    stuff: LongNamesAndManyFields;

    init() {
        self.stuff = LongNamesAndManyFields{
            alpha:1, beta:2, gamma:true, delta:"d", epsilon:false, zeta:null, eta:"e",
            theta:true, iota:"i", kappa:3, lambda:false, mu:4, nu:5, xi:true,
            omicron:6, pi:7, rho:"r", sigma:false, tau:null, upsilon:true,
            phi:false, chi:"c", psi:true, omega:"w"
        };
    }
}
