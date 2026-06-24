struct Level3 { val: Int; }

struct Level2 { inner: Level3; optInt: Int?; }

struct Level1 { deep: Level2; txt: String; }

contract MultiLayers {
    data: Level1;
    
    init() {
        self.data = Level1{
            deep: Level2{
                inner: Level3{val: 42},
                optInt: null
            },
            txt: "done"
        };
    }
}