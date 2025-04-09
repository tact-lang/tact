struct OptArray {
  v1: Int?;
  v2: Int?;
  v3: Int?;
  v4: Int?;
  v5: Int?;
  v6: Int?;
  v7: Int?;
  v8: Int?;
}

contract OptArrayHolder {
    data: OptArray;

    init() {
        self.data = OptArray{
            v1: null,v2: null,v3: null,v4: null,v5: null,v6: null,v7: null,v8: null
        };
    }
}