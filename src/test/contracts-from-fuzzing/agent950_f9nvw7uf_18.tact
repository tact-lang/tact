// test optional struct as direct contract persistent var
struct Optioned {
    foo: Int;
}

contract TopOpt {
    bar: Optioned?;

    init() {
        self.bar = null;
    }
}