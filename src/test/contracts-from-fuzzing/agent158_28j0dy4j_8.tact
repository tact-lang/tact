struct Opts {
    name: String = "Optimus";
    age: Int?;
    flag: Bool?;
}

contract OptionalStructVar {
    data: Opts;

    init() {
        self.data = Opts{
            age: null,
            flag: true
        };
    }
}