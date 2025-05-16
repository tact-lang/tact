struct SerializedMap {
    m: map<Int as uint8, Int as uint8> = emptyMap();
}

contract TestSerializedMap {
    m: SerializedMap = SerializedMap { m: emptyMap() };

    receive() {
         self.m.m.set(1, 200);
         let v = self.m.m.get(1);
         self.reply(v.toString().asComment());
    }
}
