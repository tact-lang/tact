struct Complex {
  a: Int?;
  b: Bool?;
  c: Address?;
}

contract TestContract {
    cplx: Complex;

    init() {
        self.cplx = Complex{
            a: 10,
            b: true,
            c: myAddress(),
        };
    }
}