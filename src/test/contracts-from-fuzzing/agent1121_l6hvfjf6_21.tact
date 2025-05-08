struct Details {
    number: Int;
    label: String;
    on: Bool;
}

contract StructVariousPrimitives {
    data: Details;

    init() {
        self.data = Details{number:42,label:"hi",on:true};
    }
}