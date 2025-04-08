contract LargeFlatStorage {
    v1: Int; v2: Bool; v3: String; v4: Cell; v5: Slice; v6: Address;
    v7: Int; v8: Bool; v9: String; v10: Cell; v11: Slice; v12: Address;
    v13: Int; v14: Bool; v15: String; v16: Cell; v17: Slice; v18: Address;

    init() {
        self.v1=1; self.v2=true; self.v3="a"; self.v4=emptyCell(); self.v5=self.v4.asSlice(); self.v6=myAddress();
        self.v7=2; self.v8=false; self.v9="b"; self.v10=emptyCell(); self.v11=self.v10.asSlice(); self.v12=myAddress();
        self.v13=3; self.v14=true; self.v15="c"; self.v16=emptyCell(); self.v17=self.v16.asSlice(); self.v18=myAddress();
    }
}