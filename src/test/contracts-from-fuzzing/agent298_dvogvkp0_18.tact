struct OptDeep1 { x: Int?; }
struct OptDeep2 { x: OptDeep1?; }
struct OptDeep3 { x: OptDeep2?; }

contract OptionalDeepNest {
    payload: OptDeep3;
    init() {
        self.payload = OptDeep3 { x: null };
    }
}