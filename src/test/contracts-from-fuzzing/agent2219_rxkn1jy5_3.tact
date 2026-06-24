struct DeepInner { x: Int; y: String; }

struct MiddleLayer { inner: DeepInner; z: Bool; }

struct OuterMost { mid: MiddleLayer; flag: Bool; text: String; }

contract DeepStorage {
    field: OuterMost;

    init() {
        self.field = OuterMost{
            mid: MiddleLayer{
                inner: DeepInner{ x: 42, y: "deep" },
                z: true
            },
            flag: false,
            text: "end"
        };
    }
}