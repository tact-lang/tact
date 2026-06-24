struct Bottom {
    text: String = "hello";
    flag: Bool?; // default null
}

struct Middle {
    bottom: Bottom;
    count: Int = 7;
}

struct Top {
    label: String;
    mid: Middle;
}

contract TestContract {
    info: Top;

    init() {
        self.info = Top{
            label: "top",
            mid: Middle{
                bottom: Bottom{}, // omit fields: text defaulted to 'hello', flag=null
                // count omitted, defaults to 7
            },
        };
    }
}