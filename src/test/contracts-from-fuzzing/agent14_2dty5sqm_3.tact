contract TestMapValid {
    m: map<Int, Int> = emptyMap();

    init() {
      self.m.set(1, 10);
      self.m.set(2, 20);
    }
    
    // Getter to test retrieving a stored value
    get fun testSetGet(): Int {
      return self.m.get(2)!!;
    }

    // Getter to test existence of a key
    get fun testExists(): Bool {
      return self.m.exists(1);
    }

    // Getter to test emptiness (should be false since map has entries)
    get fun testIsEmpty(): Bool {
      return self.m.isEmpty();
    }
}
