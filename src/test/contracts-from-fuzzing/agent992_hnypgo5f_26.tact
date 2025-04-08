struct S {
    x: Int?; 
    y: Bool; 
    z: Address?; 
    s: String;
}

contract TestContract {
    f: S;
    init() {
        self.f = S{
            x: null,
            y: true,
            z: null,
            s: "done"
        };
    }
}
