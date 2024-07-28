@name(query')
native idTest1();

@name(query'')
native idTest2();

@name(CHECK)
native idTest3();

@name(_internal_val)
native idTest4();

@name(message_found?)
native idTest5();

@name(get_pubkeys&signatures)
native idTest6();

@name(dict::udict_set_builder)
native idTest7();

@name(_+_)
native idTest8();

@name(__)
native idTest9();

@name(fatal!)
native idTest10();

@name(123validname)
native idTest11();

@name(2+2=2*2)
native idTest12();

@name(-alsovalidname)
native idTest13();

@name(0xefefefhahaha)
native idTest14();

@name({hehehe})
native idTest15();

@name(pa{--}in"`aaa`")
native idTest16();

@name(`I'm a function too`)
native idTest17();

@name(`any symbols ; ~ () are allowed here...`)
native idTest18();

@name(C4)
native idTest19();

@name(C4g)
native idTest20();

@name(4C)
native idTest21();

// Fun fact:
// Individually, _0x0 and _0 are totally valid identifiers in FunC, and the resulting Fift works fine too.
// But if they're together, FunC still compiles, but Fift interpreter cannot deal with that and crashes.

@name(_0x0)
native idTest22();

@name(_0)
native idTest23();

// NOTE(novusnota):
// There is a only small set of cases related to the above that our parser won't parse, but C++ FunC's will:
// The hexadecimal or decimal number, followed immediately by a single underscore.
// It can look like: 0x0_, for example. Or like: 9000_.
//
// I decided not to fix these peculiar cases, as the RegEx gets absolutely wild. Also, these are super-weird identifiers,
// which have a big chance of breaking once the Fift interpreter comes into play, as described in the "Fun fact" paragraph above.
