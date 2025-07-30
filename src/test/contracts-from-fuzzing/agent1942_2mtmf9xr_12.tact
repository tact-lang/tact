struct HugeNested {
    l1: String; l2: String; l3: String; l4: String; l5: String;
    l6: String; l7: String; l8: String; l9: String; l10: String;
}

contract HugePersist {
    f: HugeNested;

    init() {
        self.f = HugeNested{
            l1:"a",l2:"b",l3:"c",l4:"d",l5:"e",
            l6:"f",l7:"g",l8:"h",l9:"i",l10:"j",
        };
    }
}