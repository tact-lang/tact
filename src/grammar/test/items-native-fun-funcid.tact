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
// Same goes for identifiers using hashes # or emojis.
// I.e., you can have a function with any of those combinations of characters, but only one.

@name(_0x0)
native idTest22();

@name(_0)
native idTest23();

@name(0x_)
native idTest24();

@name(0x0_)
native idTest25();

@name(0_)
native idTest26();

@name(hash#256)
native idTest27();

@name(💀💀💀0xDEADBEEF💀💀💀)
native idTest28();

@name(__tact_verify_address)
native idTest29();

@name(__tact_pow2)
native idTest30();

@name(randomize_lt)
native idTest31();

@name(fixed248::asin)
native idTest32();

@name(fixed248::nrand_fast)
native idTest33();

@name(atan_f261_inlined)
native idTest34();

@name(~impure_touch)
native idTest35();

@name(~udict::delete_get_min)
native idTest36();

@name(.something)
native idTest37();

@name(f̷̨͈͚́͌̀i̵̩͔̭̐͐̊n̸̟̝̻̩̎̓͋̕e̸̝̙̒̿͒̾̕)
native idTest38();

@name(❤️❤️❤️thanks❤️❤️❤️)
native idTest39();
