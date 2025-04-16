contract TestMapCell {
  fun test() : Cell? {
      let m: map<Address, Cell> = emptyMap();
      let c: Cell = beginCell().storeUint(123, 8).endCell();
      m.set(myAddress(), c);
      return m.get(myAddress())!!;
  }
}
