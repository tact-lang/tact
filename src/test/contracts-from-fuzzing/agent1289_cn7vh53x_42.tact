// optional with serialization override: int? as coins | assign non-coin value (-1) -> should exit code 5 at runtime but accept compilation
contract OptCoinsRange {
  x: Int? as coins;

  init() {
    self.x = -5;
  }
}
