struct DefaultStruct {
 x: Int = 10;
 y: Bool = false;
 str: String = "hello";
}

contract WithDefaults {
 myStruct: DefaultStruct = DefaultStruct{};

 init() {
   self.myStruct = DefaultStruct{ x: 42, y: true, str: "bye" };
 }
}
