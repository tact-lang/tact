struct OptionalLayer1 { x: Int?; }
struct OptionalLayer2 { inner: OptionalLayer1?; }
struct OptionalLayer3 { inner: OptionalLayer2?; }

contract OptionalLayersContract {
    data: OptionalLayer3;

    init() {
        self.data = OptionalLayer3{
            inner: OptionalLayer2{
                inner: OptionalLayer1{ x: null }
            }
        };
    }
}