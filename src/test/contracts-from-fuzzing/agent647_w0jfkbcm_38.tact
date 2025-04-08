// struct with a bool and serialized integers
struct Complex {
    flag: Bool;
    x: Int as uint4;
    y: Int as int16;
    z: Int;
}

contract TestContract {
    value: Complex;

    init() {
        self.value = Complex{
            flag: true,
            x: 7,
            y: -123,
            z: 1000
        };
    }
}