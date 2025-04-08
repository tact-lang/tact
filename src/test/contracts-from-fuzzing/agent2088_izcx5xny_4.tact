struct DeepInner {
    val: Int;
}

struct MiddleLayer {
    deep: DeepInner;
}

struct OuterLayer {
    mid1: MiddleLayer;
    mid2: MiddleLayer;
    mid3: MiddleLayer;
    mid4: MiddleLayer;
    mid5: MiddleLayer;
}

contract ManyNestedLayers {
    big: OuterLayer;

    init() {
        self.big = OuterLayer{
            mid1: MiddleLayer{ deep: DeepInner{ val: 1 } },
            mid2: MiddleLayer{ deep: DeepInner{ val: 2 } },
            mid3: MiddleLayer{ deep: DeepInner{ val: 3 } },
            mid4: MiddleLayer{ deep: DeepInner{ val: 4 } },
            mid5: MiddleLayer{ deep: DeepInner{ val: 5 } }
        };
    }
}