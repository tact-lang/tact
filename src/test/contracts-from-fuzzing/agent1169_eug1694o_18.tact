struct NestedOptionalList {
    name: String?;
    nickname: String?;
    title: String?;
}

contract ManyOptionals {
    data: NestedOptionalList;

    init() {
        self.data = NestedOptionalList{name:null, nickname:null, title:null};
    }
}