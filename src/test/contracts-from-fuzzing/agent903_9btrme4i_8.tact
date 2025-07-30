struct RecNested1 { val: Int; nested: RecNested2; }
struct RecNested2 { flag: Bool; nested2: RecNested3; }
struct RecNested3 { text: String; boolean: Bool; }

contract RecStructTest {
    rec: RecNested1;

    init() {
        self.rec = RecNested1{
            val:1,
            nested: RecNested2{
                flag:true,
                nested2: RecNested3{text:"hi", boolean:false}
            }
        };
    }
}