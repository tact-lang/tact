struct SerializableStruct {
 a: Int as int8;
 b: Int as uint8;
 c: Int as int32;
 d: Int as uint32;
}

contract SerialTest {
 s: SerializableStruct = SerializableStruct{a:1,b:2,c:3,d:4};
}