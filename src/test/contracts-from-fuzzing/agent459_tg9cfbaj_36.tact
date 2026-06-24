struct TextAndFlags {
    text: String;
    flag1: Bool?;
    flag2: Bool?;
}

contract StringAndOptionFlags {
    data: TextAndFlags = TextAndFlags{
        text:"Sample text with many words",
        flag1: null,
        flag2: true
    };

    init() {
        self.data = TextAndFlags{
            text:"Another example with different words",
            flag1:true,
            flag2:null
        };
    }
}