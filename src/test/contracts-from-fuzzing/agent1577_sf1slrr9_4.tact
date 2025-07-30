struct Level3 { f: Int; opt: Bool?; }
struct Level2 { deep: Level3; label: String; }
struct Level1 { inner: Level2; flag: Bool; }

contract MultiDeep {
    nest: Level1;

    init() {
        self.nest = Level1{
            inner: Level2{
                deep: Level3{
                    f: 77,
                    opt: null,
                },
                label: "lbl",
            },
            flag: false,
        };
    }
}
