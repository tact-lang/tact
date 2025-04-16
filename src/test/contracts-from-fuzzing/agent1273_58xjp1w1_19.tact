struct Layer3 {
    val: Int?;
    label: String;
}

struct Layer2 {
    l3: Layer3;
    flag: Bool?;
}

struct Layer1 {
    l2: Layer2;
    txt: String?;
}

contract LayersTest {
    root: Layer1;

    init() {
        self.root = Layer1{l2: Layer2{l3: Layer3{val:null,label:"Lbl"},flag:null}, txt:null};
    }
}