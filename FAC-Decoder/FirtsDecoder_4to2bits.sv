
module FirtsDecoder_4to2bits (
    input A, B, C, D,
    output Y0, Y1
);

    // Cables intermedios para las conexiones
    wire notC, notD;
    wire and1, and2, or1;

    // Implementación de NOT para C y D
    not U1 (notC, C);
    not U2 (notD, D);

    // Implementación de Y0 = A AND B AND C
    and U3 (Y0, A, B, C);

    // Implementación de Y1 = AB(-C-D+CD)
    // Paso 1: (notC AND notD)
    and U4 (and1, notC, notD);
    
    // Paso 2: (C AND D)
    and U5 (and2, C, D);
    
    // Paso 3: (notC AND notD) OR (C AND D)
    or  U6 (or1, and1, and2);
    
    // Paso 4: AB AND ((notC AND notD) OR (C AND D))
    and U7 (Y1, A, B, or1);

endmodule