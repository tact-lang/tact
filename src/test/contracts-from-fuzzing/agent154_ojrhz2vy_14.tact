struct OptionalDeepInner { x: Int; }

struct OptionalDeepOuter { y: OptionalDeepInner?; }

struct OptionalDeeperOuter { z: OptionalDeepOuter?; }

contract OptionalDeep {
    deepOpt: OptionalDeeperOuter;

    init() {
        self.deepOpt = OptionalDeeperOuter{ z: null };
    }
}