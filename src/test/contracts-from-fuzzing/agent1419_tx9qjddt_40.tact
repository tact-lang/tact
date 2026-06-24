trait OnlyBools {
    x: Bool;
    y: Bool;
}

contract TraitBoolInherit(
    x: Bool,
    y: Bool,
    z: Bool
) with OnlyBools {
    receive() {
        dump(self.x);
        dump(self.y);
        dump(self.z);
    }
}