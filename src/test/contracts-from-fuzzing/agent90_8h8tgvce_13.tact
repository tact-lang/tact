struct Complex {
    a: Int?;
    b: String?;
    c: Address?;
    d: Bool?;
}

contract TestStorage {
    data: Complex = Complex{
        a: null,
        b: null,
        c: null,
        d: null
    };

    receive() {
        let z = self.data;
    }
}