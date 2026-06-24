contract ValidMap {
    // This contract uses a valid map with key type Int and value type Bool, both allowed per Tact docs  
    get fun test(): Bool {
      let m: map<Int, Bool> = emptyMap();
      m.set(42, true);
      return m.get(42)!!;
    }
}
