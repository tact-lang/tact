fun main() : Int {
  let validAddr1: Address = newAddress(0, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
  let validAddr2: Address = newAddress(-1, 0x83dfd552e63729b472fcbcc8c45ebcc6691702558b68ec7527e1ba403a0f31a8);
  return (validAddr1.toString() != "" && validAddr2.toString() != "") ? 1 : 0;
}
