struct OptionalsLayer1 { x: Int?; y: Bool?; }
struct OptionalsLayer2 { inner: OptionalsLayer1?; flag: Bool; }
struct OptionalsLayer3 { inner: OptionalsLayer2?; val: Int; }

contract TestContract {
    data: OptionalsLayer3;

    init() {
        self.data = OptionalsLayer3{
            inner: null,
            val: 5
        };
    }
}
