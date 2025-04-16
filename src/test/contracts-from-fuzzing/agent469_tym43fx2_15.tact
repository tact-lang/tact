struct Layer1 {
    lv2: Layer2?;
}

struct Layer2 {
    lv3: Layer3?;
}

struct Layer3 {
    txt: String;
}

contract DeepNull {
    deep: Layer1?;

    init() {
        self.deep = Layer1{
            lv2: Layer2{
                lv3: null
            }
        };
    }
}