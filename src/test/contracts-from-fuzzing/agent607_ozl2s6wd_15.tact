contract OptBoolNoInit {
    flag: Bool?;
    get fun flagVal(): Bool? { return self.flag; }
}