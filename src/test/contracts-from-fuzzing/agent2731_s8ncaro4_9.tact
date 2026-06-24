struct TextWrap {
    title: String;
    content: String;
}

struct IntWrap {
    num1: Int;
    num2: Int;
}

struct Mix {
    text: TextWrap;
    nums: IntWrap;
    flag: Bool;
}

contract MixedNested {
    data: Mix;

    init() {
        self.data = Mix{
            text: TextWrap{title:"a", content:"b"},
            nums: IntWrap{num1:1, num2:2},
            flag: true
        };
    }
}