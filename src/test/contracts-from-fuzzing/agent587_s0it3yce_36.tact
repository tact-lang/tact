struct DataHolder1 {
    val: Int;
}

struct DataHolder2 {
    holder: DataHolder1;
}

struct DataHolder3 {
    deep: DataHolder2;
}

struct DataHolder4 {
    more: DataHolder3;
}

contract NestedManyLayers {
    nested: DataHolder4;
    init() {
        self.nested = DataHolder4{
            more: DataHolder3{
                deep: DataHolder2{
                    holder: DataHolder1{ val:77 }
                }
            }
        };
    }
    receive() {
        let _ = self.nested.more.deep.holder.val;
    }
}