struct S {
  v1:Int; v2:Int; v3:Int; v4:Int; v5:Int; v6:Int;
  v7:Int; v8:Int; v9:Int; v10:Int; v11:Int; v12:Int;
  v13:Int; v14:Int; v15:Int; v16:Int; v17:Int; v18:Int;
}

contract LargeStruct {
    s:S;
    init() {
        self.s = S{
            v1:1,v2:2,v3:3,v4:4,v5:5,v6:6,
            v7:7,v8:8,v9:9,v10:10,v11:11,v12:12,
            v13:13,v14:14,v15:15,v16:16,v17:17,v18:18
        };
    }
}