struct S0 { a: Int }
struct S1 { p: S0 }
struct S2 { p: S1 }
struct S3 { p: S2 }
struct S4 { p: S3 }
struct S5 { p: S4 }
struct S6 { p: S5 }
struct S7 { p: S6 }
struct S8 { p: S7 }
struct S9 { p: S8 }
struct S10 { p: S9 }
struct S11 { p: S10 }
struct S12 { p: S11 }
struct S13 { p: S12 }
struct S14 { p: S13 }
struct S15 { p: S14 }
struct S16 { p: S15 }
struct S17 { p: S16 }
struct S18 { p: S17 }
struct S19 { p: S18 }
struct S20 { p: S19 }
struct S21 { p: S20 }
struct S22 { p: S21 }
struct S23 { p: S22 }
struct S24 { p: S23 }
struct S25 { p: S24 }
struct S26 { p: S25 }
struct S27 { p: S26 }
struct S28 { p: S27 }
struct S29 { p: S28 }
struct S30 { p: S29 }

contract DeepThirty {
  data: S30;

  init() {
    self.data = S30{
      p: S29{
        p: S28{
          p: S27{
            p: S26{
              p: S25{
                p: S24{
                  p: S23{
                    p: S22{
                      p: S21{
                        p: S20{
                          p: S19{
                            p: S18{
                              p: S17{
                                p: S16{
                                  p: S15{
                                    p: S14{
                                      p: S13{
                                        p: S12{
                                          p: S11{
                                            p: S10{
                                              p: S9{
                                                p: S8{
                                                  p: S7{
                                                    p: S6{
                                                      p: S5{
                                                        p: S4{
                                                          p: S3{
                                                            p: S2{
                                                              p: S1{
                                                                p: S0{a:1}
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    };
  }
}