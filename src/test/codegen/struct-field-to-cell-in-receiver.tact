struct MyStruct {
    x: Int;
    y: Int;
    z: Int;
}

contract MyContract {
    myField: MyStruct;

    init(x: Int, y: Int, z: Int) {
        self.myField = MyStruct { x: x, y: y, z: z };
    }

    receive() {
        self.reply(self.myField.toCell()); // this line is causing the error
    }
}