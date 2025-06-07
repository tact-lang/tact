fun testNewBasechainAddress() : Bool {
    let b: BasechainAddress = newBasechainAddress(0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
    return b.hash != null;
}
