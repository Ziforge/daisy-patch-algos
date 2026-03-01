# Daisy Patch Algo Collection

**A centralised educational resource** cataloging community firmware projects for the [Electro-Smith Daisy](https://www.electro-smith.com/) platform.

This repository exists **for learning and education purposes only** — to help students, hobbyists, and developers discover, study, and learn from the incredible work the Daisy community has produced. Every project listed here links back to its **original source repository**, and all original licenses and terms must be respected.

> **Important Notices:**
>
> - **All credit belongs to the original authors.** This repo is an index and build aggregator, not a claim of ownership.
> - **Every entry links to its original repository.** Please visit the original repos to star them, read their docs, and support the authors.
> - **All original licenses apply.** Each project's license is noted where known. You must comply with the original project's license terms for any use, modification, or redistribution.
> - **Takedown requests:** If you are the author of any project listed here and would like it removed, please [open an issue](../../issues) or email and it will be removed promptly, no questions asked.

---

## Quick Start

1. Go to [Releases](../../releases)
2. Download the `.bin` for the algorithm you want
3. Flash it using the [Daisy Web Programmer](https://electro-smith.github.io/Programmer/) or `dfu-util`
4. Visit the **original repo** (linked in the catalog below) to read the docs and support the author

## Build Status

**75+ of 130 projects produce firmware** (built from source or downloaded from author releases). Automated pre-build patches handle DaisySP V1.0.0 API changes (MoogLadder/ReverbSc moved to LGPL, LadderFilter rename, audio callback const, GPIO struct API). 7 projects need manual porting and are marked **"needs update"**. Some projects use non-standard build systems (CMake, Cargo/Rust, STM32CubeIDE, Arduino) and are cataloged but not yet integrated.

**PRs welcome** for the remaining projects. See the [build logs](../../actions) for specific errors.

Projects that already publish `.bin` files in their own GitHub releases are downloaded directly and always work regardless of build compatibility.

## Supported Hardware

| Hardware | Description |
|----------|-------------|
| **Daisy Patch** | 4-voice Eurorack module (4 CV ins, 2 audio ins, 2 audio outs, OLED, encoder) |
| **Patch.Init()** | Programmable Eurorack module (Patch Submodule based) |
| **Patch SM** | Patch Submodule for custom Eurorack designs |
| **Daisy Seed** | Bare dev board (used in Terrarium, custom PCBs) |
| **Daisy Pod** | Desktop dev board with knobs, buttons, encoder |
| **Daisy Field** | Desktop board with 8 sliders, 8 knobs, OLED |
| **NE Versio** | Noise Engineering Versio platform (Daisy Seed internally) |
| **Terrarium** | PedalPCB guitar pedal platform |
| **FunBox** | GuitarML stereo pedal platform |
| **Hothouse** | Cleveland Music Co. pedal kit |

---

## Catalog

### 1. Official Examples (electro-smith/DaisyExamples)

Source: [electro-smith/DaisyExamples](https://github.com/electro-smith/DaisyExamples) | License: MIT

#### Daisy Patch

| Algorithm | Category | Description |
|-----------|----------|-------------|
| [Compressor](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Compressor) | Dynamics | Dynamic range compressor |
| [EnvelopeOscillator](https://github.com/electro-smith/DaisyExamples/tree/master/patch/EnvelopeOscillator) | Oscillator | Envelope-controlled oscillator |
| [FilterBank](https://github.com/electro-smith/DaisyExamples/tree/master/patch/FilterBank) | Filter | Multi-band filter bank |
| [Midi](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Midi) | Utility | MIDI input/output example |
| [MultiDelay](https://github.com/electro-smith/DaisyExamples/tree/master/patch/MultiDelay) | Delay | Multi-tap delay effect |
| [Nimbus](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Nimbus) | Granular | Port of Mutable Instruments Clouds *(needs update)* |
| [Noise](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Noise) | Oscillator | Noise generator |
| [PluckEcho](https://github.com/electro-smith/DaisyExamples/tree/master/patch/PluckEcho) | Physical Modeling | Polyphonic Karplus-Strong + 10s SDRAM delay + reverb |
| [PolyOsc](https://github.com/electro-smith/DaisyExamples/tree/master/patch/PolyOsc) | Oscillator | Polyphonic oscillator |
| [QuadEnvelope](https://github.com/electro-smith/DaisyExamples/tree/master/patch/QuadEnvelope) | Modulation | Quad envelope generator |
| [QuadMixer](https://github.com/electro-smith/DaisyExamples/tree/master/patch/QuadMixer) | Mixer | 4-channel mixer |
| [QuadraphonicMixer](https://github.com/electro-smith/DaisyExamples/tree/master/patch/QuadraphonicMixer) | Mixer | 4-channel quadraphonic mixer |
| [SampleAndHold](https://github.com/electro-smith/DaisyExamples/tree/master/patch/SampleAndHold) | CV/Utility | Sample and hold module |
| [Sequencer](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Sequencer) | Sequencer | Step sequencer |
| [SequentialSwitch](https://github.com/electro-smith/DaisyExamples/tree/master/patch/SequentialSwitch) | Utility | Sequential switch for routing |
| [Svf](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Svf) | Filter | State variable filter (LP/HP/BP) |
| [Torus](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Torus) | Physical Modeling | Port of Mutable Instruments Rings |
| [lfo](https://github.com/electro-smith/DaisyExamples/tree/master/patch/lfo) | Modulation | Low-frequency oscillator |
| [logic](https://github.com/electro-smith/DaisyExamples/tree/master/patch/logic) | Utility | Logic operations on signals |
| [vco](https://github.com/electro-smith/DaisyExamples/tree/master/patch/vco) | Oscillator | Voltage-controlled oscillator |
| [verb](https://github.com/electro-smith/DaisyExamples/tree/master/patch/verb) | Reverb | Reverb effect |

#### Patch SM

| Algorithm | Category | Description |
|-----------|----------|-------------|
| [EnvelopeExample](https://github.com/electro-smith/DaisyExamples/tree/master/patch_sm/EnvelopeExample) | Modulation | Envelope generator |
| [Looper](https://github.com/electro-smith/DaisyExamples/tree/master/patch_sm/Looper) | Looper | Audio looper |
| [PassthruExample](https://github.com/electro-smith/DaisyExamples/tree/master/patch_sm/PassthruExample) | Utility | Audio passthrough |
| [RandomCvExample](https://github.com/electro-smith/DaisyExamples/tree/master/patch_sm/RandomCvExample) | CV | Random CV output |
| [ReverbExample](https://github.com/electro-smith/DaisyExamples/tree/master/patch_sm/ReverbExample) | Reverb | Reverb effect |
| [SimpleOscillator](https://github.com/electro-smith/DaisyExamples/tree/master/patch_sm/SimpleOscillator) | Oscillator | Basic oscillator |
| [TripleSaw](https://github.com/electro-smith/DaisyExamples/tree/master/patch_sm/TripleSaw) | Oscillator | Triple sawtooth oscillator |

---

### 2. Mutable Instruments Ports

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| Nimbus (Clouds) | [DaisyExamples/patch/Nimbus](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Nimbus) | MI Clouds granular processor | Patch | MIT |
| Torus (Rings) | [DaisyExamples/patch/Torus](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Torus) | MI Rings resonator | Patch | MIT |
| Resonate | [tylerreckart/resonate](https://github.com/tylerreckart/resonate) | Enhanced MI Rings port *(needs update)* | Patch | MIT |
| Plaitsy | [Forum](https://forum.electro-smith.com/t/plaitsy-plaits-port-for-patch-mutable-daisies/8982) | MI Plaits macro-oscillator (Mutable Daisies series) | Patch | MIT |
| PlaitsPatchInit | [hemmer/PlaitsPatchInit](https://github.com/hemmer/PlaitsPatchInit) | MI Plaits port for patch.Init() (WIP) | Patch.Init() | Unknown |
| Torus Plus | [algoritmarte/algodaisy](https://github.com/algoritmarte/algodaisy) | Enhanced Rings + delay + random rhythm/note gen *(needs update)* | Patch | Unknown |
| Rings Versio | [NE firmware index](https://github.com/Maxhodges/noise-engineering-firmware-index) | MI Rings for NE Versio | Versio | Unknown |
| Torus patch.Init() | [Forum](https://forum.electro-smith.com/t/mi-rings-torus-port-for-patch-init/3735) | MI Rings for patch.Init() | Patch.Init() | Unknown |
| Mutables_Daisies | [CyberDuck79/Mutables_Daisies](https://github.com/CyberDuck79/Mutables_Daisies) | Multi-module MI ports collection (bins available) | Patch | Unknown |

---

### 3. Reverb

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| DaisyCloudSeed | [erwincoumans/DaisyCloudSeed](https://github.com/erwincoumans/DaisyCloudSeed) | CloudSeed algorithmic reverb | Patch | MIT |
| DaisyCloudSeed (Terrarium) | [GuitarML/DaisyCloudSeed](https://github.com/GuitarML/DaisyCloudSeed) | CloudSeed for Terrarium pedal | Terrarium | MIT |
| daisy-reverb | [baylessj/daisy-reverb](https://github.com/baylessj/daisy-reverb) | CloudSeed fork with expanded controls *(needs update)* | Terrarium | MIT |
| Cloudy Reverb | [erwincoumans/DaisyCloudSeed](https://github.com/erwincoumans/DaisyCloudSeed) | MI Rings/Clouds reverb (DaisyBouquet) | Patch | MIT |
| daisy-reverb-playground | [Farmer2K5/daisy-reverb-playground](https://github.com/Farmer2K5/daisy-reverb-playground) | Modular reverb building blocks | Seed | MIT |
| Sploodge Reverb | [ModWiggler](https://modwiggler.com/forum/viewtopic.php?t=279135) | Shimmer reverb + pitch shift + chorus | Seed | Unknown |
| DaisyVerb | [adion12/DaisyVerb](https://github.com/adion12/DaisyVerb) | Collection of reverb algorithms *(needs update)* | Seed | Unknown |
| Griesinger Reverb | [AMslHub/Daisy_Griesinger_Reverb](https://github.com/AMslHub/Daisy_Griesinger_Reverb) | Lexicon-style Griesinger reverb | Seed | Unknown |
| daisyverb | [PaulBatchelor/daisyverb](https://github.com/PaulBatchelor/daisyverb) | Reverb by Soundpipe creator Paul Batchelor | Patch | Unknown |
| MiniVerb | [benjiaomodular/MiniVerb](https://github.com/benjiaomodular/MiniVerb) | Through-hole reverb Eurorack module | Seed | Unknown |
| DaisyVerb (benjiao) | [benjiaomodular/DaisyVerb](https://github.com/benjiaomodular/DaisyVerb) | Simple Eurorack reverb module | Seed | Unknown |
| terrarium-reverb | [fxwiegand/terrarium-reverb](https://github.com/fxwiegand/terrarium-reverb) | Reverb for Terrarium (bin available) | Terrarium | Unknown |
| PlateauNEVersio | [abluenautilus/PlateauNEVersio](https://github.com/abluenautilus/PlateauNEVersio) | Valley Plateau reverb port for NE Versio | Versio | GPL-3.0 |
| Qverb | [Quinienl/Qverb](https://github.com/Quinienl/Qverb) | Reverb for kxmx Bluemchen (bin in repo) | Bluemchen | MIT |

---

### 4. Delay

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| MultiDelay | [DaisyExamples/patch/MultiDelay](https://github.com/electro-smith/DaisyExamples/tree/master/patch/MultiDelay) | Multi-tap delay | Patch | MIT |
| Saturn (FunBox) | [GuitarML/FunBox](https://github.com/GuitarML/FunBox) | Spectral delay via STFT | FunBox | MIT |
| TapeoVersio | [onoma2/TapeoVersio](https://github.com/onoma2/TapeoVersio) | Tape delay + fuzz + envelope follower *(needs update)* | Versio | Unknown |
| ReticulumVersio | [ModWiggler](https://modwiggler.com/forum/viewtopic.php?t=280196) | Asynchronous delay/looper (Steve Reich style) | Versio | Unknown |
| Veno-Echo | [AdamFulford/Veno-Echo](https://github.com/AdamFulford/Veno-Echo) | Stereo digital delay Eurorack module *(needs update)* | Seed | Unknown |
| terrarium-tapedelay | [michaeldonovan/terrarium-tapedelay](https://github.com/michaeldonovan/terrarium-tapedelay) | CHOWTape hysteresis tape delay | Terrarium | Unknown |
| daisy-sdram-delaylines | [Farmer2K5/daisy-sdram-delaylines](https://github.com/Farmer2K5/daisy-sdram-delaylines) | SDRAM-backed delay line classes | Seed | Unknown |
| DaisySTFT | [amcerbu/DaisySTFT](https://github.com/amcerbu/DaisySTFT) | Short-time Fourier transform example | Seed | Unknown |
| H910 Harmonizer | [1202-comstock-miles/Daisy-Patch-H910](https://github.com/1202-comstock-miles/Daisy-Patch-H910) | Eventide H-910 Harmonizer + delay emulation | Patch | Unknown |
| DaisyDelay | [MaxBauV/DaisyDelay](https://github.com/MaxBauV/DaisyDelay) | Delay for Patch SM | Patch SM | Unknown |
| PatchSmDelay | [jasonbirchler/PatchSmDelay](https://github.com/jasonbirchler/PatchSmDelay) | Delay firmware for patch.Init() | Patch.Init() | Unknown |
| DelayOfGame | [graphex/DelayOfGame](https://github.com/graphex/DelayOfGame) | Audio delay utility | Pod | Unknown |
| Kaseta | [zlosynth/kaseta](https://github.com/zlosynth/kaseta) | Saturating tape delay and feedback sculptor (Rust, bin available) | Patch SM | CC-BY-SA-4.0 |
| Tap-O-Matic | [cormallen/tap-o-matic](https://github.com/cormallen/tap-o-matic) | OAM Time Machine fork with pan, CV level, filters | Patch SM | Other |
| TimeMachine (Rozendal) | [TimoRozendal/time-machine](https://github.com/TimoRozendal/time-machine) | OAM Time Machine fork with resonant filters per tap (bin available) | Patch SM | Other |

---

### 5. Synthesizers (Polyphonic / VA / Subtractive)

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| Pollen(8) | [hammondeggsmusic.ca](https://hammondeggsmusic.ca/daisy/pollen8.html) | 8-voice VA + 6-op FM, SD card patches | Field/Pod | Unknown |
| Helical | [SdkcInstruments/Helical](https://github.com/SdkcInstruments/Helical) | 16-voice autoregressive wavetable synth *(needs update)* | Seed | Unknown |
| Dualie | [danielkinahan/dualie](https://github.com/danielkinahan/dualie) | 12-voice poly: dual osc, Moog ladder, LFO, FX *(needs update)* | Seed | Unknown |
| 7-Voice VA | [Nettech15/Daisy-Seed-7-Voice-VA-Synthesizer](https://github.com/Nettech15/Daisy-Seed-7-Voice-VA-Synthesizer) | 7-voice VA, dual osc, 4-pole LPF, USB-MIDI *(needs update)* | Seed | Unknown |
| 8-Voice VA | [funkbungus/Daisy-Seed-8-Voice-VA-Synthesizer](https://github.com/funkbungus/Daisy-Seed-8-Voice-VA-Synthesizer) | 8-voice fork with improved MIDI/ADSR *(needs update)* | Seed | Unknown |
| Botrytis | [johnnyhoffman/botrytis](https://github.com/johnnyhoffman/botrytis) | MIDI mono synth with FM, assignable I/O *(needs update)* | Patch | Unknown |
| daisy_polysynth | [jcampbellcodes/daisy_polysynth](https://github.com/jcampbellcodes/daisy_polysynth) | Simple poly synth + Costello reverb | Seed | Unknown |
| podsynth | [charlieb/podsynth](https://github.com/charlieb/podsynth) | 6-voice poly synth with MIDI | Pod | Unknown |
| My-Dirty-Synth | [lucblender/My-Dirty-Synth](https://github.com/lucblender/My-Dirty-Synth) | East-coast synth: decimator + wavefolder | Seed | Unknown |
| daisy-synth (Rust) | [nicochatzi/daisy-synth](https://github.com/nicochatzi/daisy-synth) | Rust-based synthesizer | Seed | Unknown |
| Poly Saw USB MIDI | [zvodd/DaisySeed--polyphonic_saw_via_USB_MIDI](https://github.com/zvodd/DaisySeed--polyphonic_saw_via_USB_MIDI) | Polyphonic saw via USB MIDI | Seed | Unknown |
| Dahlia | [vulcu/dahlia](https://github.com/vulcu/dahlia) | Waveshaping poly synth via hvcc/PureData | Seed | Unknown |
| Ubersaw | [house-of-houses/ubersaw](https://github.com/house-of-houses/ubersaw) | Roland JP-8000 supersaw recreation *(needs update)* | Patch.Init() | Unknown |
| Corrode | [house-of-houses/corrode](https://github.com/house-of-houses/corrode) | TB-303 acid synth voice (Open303-based) *(needs update)* | Patch.Init() | Unknown |
| PolyAnalog | [alexiszbik/polyanalog](https://github.com/alexiszbik/polyanalog) | 4-voice polyphonic VA synth *(needs update)* | Seed | Unknown |
| Mono Synth | [NickCulbertson/Daisy-Seed-Mono-Synth](https://github.com/NickCulbertson/Daisy-Seed-Mono-Synth) | Super simple mono synth | Seed | Unknown |
| NucleoSynth | [Nettech15/STM32-Daisy-Seed-NucleoSynth](https://github.com/Nettech15/STM32-Daisy-Seed-NucleoSynth) | 6-voice synth with Karlsen LPF | Seed | Unknown |
| DripSynth | [dalenicholson/DaisyPatchDripSynth](https://github.com/dalenicholson/DaisyPatchDripSynth) | Generative drip synthesizer | Patch | Unknown |
| Spark-AE | [clectric-diy/Spark-AE](https://github.com/clectric-diy/Spark-AE) | Synth module for AE Modular format | Seed | Unknown |
| vasvas | [stone-voices/vasvas](https://github.com/stone-voices/vasvas) | Noisebox with FX processor | Seed | Unknown |
| Phosphorescent | [sunchimes/phosphorescent](https://github.com/sunchimes/phosphorescent) | Shimmery arpeggiator | Seed | Unknown |
| Takshaka | [wendallsan/song-naga-takshaka](https://github.com/wendallsan/song-naga-takshaka) | Supersaw synthesizer | Seed | Unknown |
| 2cats1bag | [wendallsan/song-naga-2cats1bag](https://github.com/wendallsan/song-naga-2cats1bag) | Complex oscillator | Seed | Unknown |
| SynthMachine | [ConnorGiles00101/SynthMachine](https://github.com/ConnorGiles00101/SynthMachine) | Modular synth: SSI2130 VCO + SSI2140 filter + Daisy | Seed | Unknown |
| OmniSeed | [wolfpunk25/OmniSeed](https://github.com/wolfpunk25/OmniSeed) | Omnichord for Daisy Pod (WIP) | Pod | Unknown |
| OscPocket VA | [moonfriendsynth/OscPocket-VA-Daisy-Pod](https://github.com/moonfriendsynth/OscPocket-VA-Daisy-Pod) | OscPocket VA pocket synth | Pod | Unknown |
| Weasel | [joebmz98/Weasel-West-Coast-Synthesiser](https://github.com/joebmz98/Weasel-West-Coast-Synthesiser) | West coast synth inspired by Buchla Easel *(needs update)* | Seed | Unknown |
| acid-swarm | [Fyde0/acid-swarm](https://github.com/Fyde0/acid-swarm) | Saw swarm mono synth with acid filter (bin available) | Field | Unknown |

---

### 6. FM Synthesis

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| Op6 | [Forum](https://forum.electro-smith.com/t/op6-6-operator-fm-synth/5358), [carlvp/daisylab](https://github.com/carlvp/daisylab) | 6-operator FM, reads DX7 SysEx patches | Seed | Unknown |
| Pollen(8) VA+FM | [hammondeggsmusic.ca](https://hammondeggsmusic.ca/daisy/pollen8_vafm_2.html) | Combined VA + 6-op FM engine | Field | Unknown |
| DaisyX7 | [jacobvosmaer/DaisyX7](https://github.com/jacobvosmaer/DaisyX7) | DX7 synthesis for Field / patch.Init() *(needs update)* | Field/Patch.Init() | Unknown |
| CZengine | [jacobvosmaer/CZengine](https://github.com/jacobvosmaer/CZengine) | Casio CZ phase distortion synthesis | Pod | Unknown |
| PolyFM | [alexiszbik/polyfm](https://github.com/alexiszbik/polyfm) | FM synth *(needs update)* | Seed | Unknown |

---

### 7. Additive / Wavetable / Spectral

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| AdditiveVoice | [stablum/AdditiveVoice](https://github.com/stablum/AdditiveVoice) | Additive synth inspired by XAOC Odessa | Patch | Unknown |
| Daisy-Harmoniqs | [Krakenpine/Daisy-Harmoniqs](https://github.com/Krakenpine/Daisy-Harmoniqs) | 6-10 voice additive, 8 harmonics each *(needs update)* | Seed | Unknown |
| daisy-fast-stft | [Farmer2K5/daisy-fast-stft](https://github.com/Farmer2K5/daisy-fast-stft) | STFT framework for spectral processing | Seed | Unknown |
| Venus (FunBox) | [GuitarML/FunBox](https://github.com/GuitarML/FunBox) | Spectral reverb via FFT | FunBox | MIT |
| Achordion | [zlosynth/achordion](https://github.com/zlosynth/achordion) | Chord-crafting quantizing wavetable oscillator (Rust, bin available) | Patch SM | CC-BY-SA-4.0 |

---

### 8. Granular Synthesis

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| DaisyGranular | [erwincoumans/DaisyCloudSeed](https://github.com/erwincoumans/DaisyCloudSeed) | Granular synth (Instruo Arbhar inspired), SD card WAV | Patch | MIT |
| Daisy_Gran | [holographica/Daisy_Gran](https://github.com/holographica/Daisy_Gran) | Granular synthesizer *(needs update)* | Pod | Unknown |
| Sitira | [backtail/sitira-embedded-daisy](https://github.com/backtail/sitira-embedded-daisy) | 34HP Eurorack granular, Rust, 2.2" screen | Seed | Unknown |
| Uranus (FunBox) | [GuitarML/FunBox](https://github.com/GuitarML/FunBox) | Granular delay + FM synth | FunBox | MIT |
| Dream | [eyebrain/Dream](https://github.com/eyebrain/Dream) | Advanced granular synth *(needs update)* | Patch | Unknown |
| Grainwaves | [TurpinL/Grainwaves](https://github.com/TurpinL/Grainwaves) | GR-1 inspired granular synth *(needs update)* | Patch SM | Unknown |
| STR500 | [yannseznec/STR500-stringSampler](https://github.com/yannseznec/STR500-stringSampler) | Granular string sampler | Seed | Unknown |
| GranularDaisyPod | [matildarosevin/GranularDaisyPod](https://github.com/matildarosevin/GranularDaisyPod) | Real-time granular synthesis | Pod | Unknown |
| GranularDaisyPodCapacitive | [matildarosevin/GranularDaisyPodCapacitive](https://github.com/matildarosevin/GranularDaisyPodCapacitive) | Granular synth with capacitive sensors | Pod | Unknown |
| max-grainz | [musicdevghost/max-grainz](https://github.com/musicdevghost/max-grainz) | Granular synth (Max Gen~) | Patch | Unknown |
| murmurator | [lewis1286/murmurator](https://github.com/lewis1286/murmurator) | Granular controlled by boids/flocking algorithm *(needs update)* | Patch | Unknown |

---

### 9. Looper / Sampler

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| DaisyBouquet Sample Player | [erwincoumans/DaisyCloudSeed](https://github.com/erwincoumans/DaisyCloudSeed) | WAV player from SD (8/16/24/32-bit, up to 48MB) | Patch | MIT |
| Ouroboros Loop Station | [kooliha/Ouroboros_Loop_Station](https://github.com/kooliha/Ouroboros_Loop_Station) | 5-track looper, no menu diving | Seed | Unknown |
| DaisyMultiLooper | [colinlove/DaisyMultiLooper](https://github.com/colinlove/DaisyMultiLooper) | Multi-channel synced looper *(needs update)* | Seed | Unknown |
| Wreath | [hirnlego/wreath](https://github.com/hirnlego/wreath) | Looper inspired by Mimeophon/Softcut *(needs update)* | Bluemchen | Unknown |
| Repetita Versio | [hirnlego/repetita-versio](https://github.com/hirnlego/repetita-versio) | Multifaceted looper for Versio (Wreath engine) | Versio | Unknown |
| CRCLTR | [s3g/crcltr](https://github.com/s3g/crcltr) | Stereo looper, crossfade/ducking modes, 32s | Versio | Unknown |
| TriwalkmaVersio | [onoma2/TriwalkmaVersio](https://github.com/onoma2/TriwalkmaVersio) | Three independent loopers *(needs update)* | Versio | Unknown |
| daisy-looper (Rust) | [mtthw-meyer/daisy-looper](https://github.com/mtthw-meyer/daisy-looper) | Looper in Rust | Seed | MIT |
| Pluto (FunBox) | [GuitarML/FunBox](https://github.com/GuitarML/FunBox) | Dual looper | FunBox | MIT |
| SLS_v1 | [Forum](https://forum.electro-smith.com/t/sls-v1-sampler-looper-slicer-daisy-patch/1819) | Sampler/looper/slicer | Patch | Unknown |
| LoopFX | [DavidJones10/LoopFX](https://github.com/DavidJones10/LoopFX) | Looper + multi-effects with modular signal chain | Seed | Unknown |
| daisy_looper (SD) | [willemOH/daisy_looper](https://github.com/willemOH/daisy_looper) | SD card looper, persists across power cycles | Seed | Unknown |
| dptlooper | [doctea/dptlooper](https://github.com/doctea/dptlooper) | Looper for DPT/Daisy Patch | Patch | Unknown |
| bluemchen looper | [ijnekenamay/kxmx_bluemchen_looper](https://github.com/ijnekenamay/kxmx_bluemchen_looper) | Dual looper for kxmx bluemchen | Bluemchen | Unknown |
| DSP Playground | [mokafari/DaisySeed-DSP-Playground](https://github.com/mokafari/DaisySeed-DSP-Playground) | DSP effects + DJFX looper | Seed | Unknown |
| Sampler | [v4nz666/Sampler](https://github.com/v4nz666/Sampler) | Daisy Seed-based sampler | Seed | Unknown |
| WavPlayer | [sedurCode/WavPlayer](https://github.com/sedurCode/WavPlayer) | Multitrack sample player | Pod | Unknown |
| SAMPLER CNA | [crearttech/Desarrollo-SAMPLER_CNA-CREART.TECH](https://github.com/crearttech/Desarrollo-SAMPLER_CNA-CREART.TECH) | Sample-based instrument | Seed | Unknown |
| OAM Time Machine | [oamodular/time-machine](https://github.com/oamodular/time-machine) | Looper/recorder for Eurorack with expander | Seed | Other |
| Gloop | [cutlasses/GloopResources](https://github.com/cutlasses/GloopResources) | 4-playhead performance looper (firmware only, bins in repo) | Seed | Unknown |

---

### 10. Distortion / Waveshaping

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| Kudzu (Flora) | [blackboxaudio/flora](https://github.com/blackboxaudio/flora) | Expressive distortion/wavefolder | Patch.Init() | Unknown |
| lx-deciim | [lucblender/lx-deciim](https://github.com/lucblender/lx-deciim) | Dual-channel bitcrusher Eurorack *(needs update)* | Seed | Unknown |
| terrarium-bitcrusher | [rocketmax/terrarium-bitcrusher](https://github.com/rocketmax/terrarium-bitcrusher) | Bitcrush effect for Terrarium *(needs update)* | Terrarium | Unknown |

---

### 11. Multi-Effect Platforms

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| IronPedal | [snail23/ironpedal](https://github.com/snail23/ironpedal) | 16 effects: OD, chorus, comp, verb, autowah, trem, looper, decimator, phaser, delay, flanger, pitch shift, harmonizer | Terrarium | MIT |
| GuitarML Seed | [GuitarML/Seed](https://github.com/GuitarML/Seed) | Neural amp models + reverb + delay + tremolo + looper | Terrarium | MIT |
| FunBox | [GuitarML/FunBox](https://github.com/GuitarML/FunBox) | 10 planetary-themed stereo effects (Mars/Jupiter/Neptune/Pluto/Venus/Saturn/Mercury/Earth/Uranus/MidiKeys) | FunBox | MIT |
| DaisySeedProjects | [bkshepherd/DaisySeedProjects](https://github.com/bkshepherd/DaisySeedProjects) | Pedal platform: tremolo, chorus, OD, auto-pan, pitch shift, comp, EQ, tuner, looper | Seed | MIT |
| MultiVersio | [fluffyaudio/MultiVersio](https://github.com/fluffyaudio/MultiVersio) | 7 switchable effects for NE Versio *(needs update)* | Versio | Unknown |
| DaisyEffects | [GuitarML/DaisyEffects](https://github.com/GuitarML/DaisyEffects) | Individual DaisySP effects for Terrarium *(needs update)* | Terrarium | MIT |
| DaisyFxPlatform | [omar-karray.github.io](https://omar-karray.github.io/DaisyFxPlatform/) | 4-block FX module: MANGLE/SCULPT/DIFFUSE/REDUCE | Seed | Unknown |
| dat ting | [Len42/dat-ting](https://github.com/Len42/dat-ting) | 10HP multi-function: VCO, delay, more *(needs update)* | Seed | MIT |
| Daisy_Guitar_Pedal | [jerry20091103/Daisy_Guitar_Pedal](https://github.com/jerry20091103/Daisy_Guitar_Pedal) | Multi-FX: analog OD + IR amp sim, 10 presets | Seed | Unknown |
| HothouseExamples | [clevelandmusicco/HothouseExamples](https://github.com/clevelandmusicco/HothouseExamples) | Effects for Hothouse pedal kit | Hothouse | MIT |
| GlitchPedal | [willbearfruits/GlitchPedal](https://github.com/willbearfruits/GlitchPedal) | 8 real-time effects with 1024-pt FFT *(needs update)* | Seed | Unknown |
| Droplets | [AquaMorph/Droplets](https://github.com/AquaMorph/Droplets) | Multi-program framework for Patch *(needs update)* | Patch | Unknown |
| DaisySphere | [tfroehlich82/DaisySphere](https://github.com/tfroehlich82/DaisySphere) | Hemisphere-style multi-applet framework *(needs update)* | Patch | Unknown |
| Olearia | [CarlColglazier/Olearia](https://github.com/CarlColglazier/Olearia) | Modular applets for Patch (bin available) | Patch | Unknown |
| DaisyFxPlatform | [omar-karray.github.io](https://omar-karray.github.io/DaisyFxPlatform/) | 4-block FX module: MANGLE/SCULPT/DIFFUSE/REDUCE | Seed | Unknown |

---

### 12. Neural Network / Amp Modeling

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| NeuralSeed | [GuitarML/NeuralSeed](https://github.com/GuitarML/NeuralSeed) | GRU neural amp/pedal emulation, trainable models | Terrarium | MIT |
| Mercury | [GuitarML/Mercury](https://github.com/GuitarML/Mercury) | Neural Amp Modeler (NAM) engine | FunBox | MIT |
| nam-pedal | [tone-3000/nam-pedal](https://github.com/tone-3000/nam-pedal) | NeuralAmpModeler demo on Daisy Seed *(needs update)* | Seed | Unknown |

---

### 13. Drone / Ambient / Generative

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| DaisyDrone (cutlasses) | [cutlasses/DaisyDrone](https://github.com/cutlasses/DaisyDrone) | 18 sine waves, 3-way wavefolding | Seed | Unknown |
| DaisyDrone (ThomArmax) | [ThomArmax/DaisyDrone](https://github.com/ThomArmax/DaisyDrone) | Basic drone synth | Seed | Unknown |
| Dryftor | [MrBlueXav/Dryftor](https://github.com/MrBlueXav/Dryftor) | 8 drifting polyblep saws + delay/phaser/chorus | Pod | Unknown |
| Daikrispator | [MrBlueXav/Daikrispator](https://github.com/MrBlueXav/Daikrispator) | Autonomous experimental music synth | Pod | Unknown |
| Lotus (Flora) | [blackboxaudio/flora](https://github.com/blackboxaudio/flora) | Binaural meditation oscillator | Patch.Init() | Unknown |
| Audrey II | [FedeRepic/audrey-daisy](https://github.com/FedeRepic/audrey-daisy) | Droning horroscape (Karplus-Strong) | Seed | Unknown |
| Stocharythm-box | [MrBlueXav/Stocharythm-box](https://github.com/MrBlueXav/Stocharythm-box) | Strange generative drum machine | Seed | Unknown |

---

### 14. Noise Engineering Versio (Third-Party Firmware)

Index: [Maxhodges/noise-engineering-firmware-index](https://github.com/Maxhodges/noise-engineering-firmware-index)

| Project | URL | Description | Author |
|---------|-----|-------------|--------|
| AcidusVersio | [abluenautilus/AcidusVersio](https://github.com/abluenautilus/AcidusVersio) | TB-303 emulator synth voice | Blue Nautilus |
| ProteusVersio | [abluenautilus/ProteusVersio](https://github.com/abluenautilus/ProteusVersio) | Generative melodic sequencer *(needs update)* | Blue Nautilus |
| MegatronVersio | (Blue Nautilus GitHub) | Korg Monotron-inspired delay | Blue Nautilus |
| CampestriaVersio | [ModWiggler](https://modwiggler.com/forum/viewtopic.php?t=282590) | Dattorro/Plateau reverb | Dale Johnson |
| MultiVersio | [fluffyaudio/MultiVersio](https://github.com/fluffyaudio/MultiVersio) | 7 switchable effects | FluffyAudio |
| TapeoVersio | [onoma2/TapeoVersio](https://github.com/onoma2/TapeoVersio) | Distorted tape echo | onoma2 |
| TriwalkmaVersio | [onoma2/TriwalkmaVersio](https://github.com/onoma2/TriwalkmaVersio) | Three parallel loopers | onoma2 |
| CRCLTR | [s3g/crcltr](https://github.com/s3g/crcltr) | Stereo looper | s3g |
| Repetita Versio | [hirnlego/repetita-versio](https://github.com/hirnlego/repetita-versio) | Drifting looper (Wreath engine) | hirnlego |
| Stray Drum | [jasmineandolivetrees.com](https://jasmineandolivetrees.com/pages/stray-drum-versio-firmware) | Drum synthesis | Jasmine & Olive Trees |
| Blossom | [abluenautilus/Blossom](https://github.com/abluenautilus/Blossom) | Alt firmware for Qu-Bit Bloom | Blue Nautilus |
| Audrey II Versio | [KoSv/DaisyVersio_Audrey_II](https://github.com/KoSv/DaisyVersio_Audrey_II) | Audrey II synth ported to Versio | KoSv |
| PlateauNEVersio | [abluenautilus/PlateauNEVersio](https://github.com/abluenautilus/PlateauNEVersio) | Valley Plateau reverb | Blue Nautilus |
| JawariLegio | [abluenautilus/JawariLegio](https://github.com/abluenautilus/JawariLegio) | Tanpura machine for NE Legio (bin available) | Blue Nautilus |

---

### 14b. Qu-Bit Aurora (Third-Party Firmware)

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| Aurora Firmwares | [jfriess/Aurora-Firmwares](https://github.com/jfriess/Aurora-Firmwares) | Custom firmware for Qu-Bit Aurora (Tempest, bin available) | Aurora | Unknown |
| Aurora HSO | [thesquaregroot/aurora-hso](https://github.com/thesquaregroot/aurora-hso) | Harmonic Shift Operator firmware (bin available) | Aurora | MIT |
| SpectralBandSweep | [Tsarpf/SpectralBandSweep](https://github.com/Tsarpf/SpectralBandSweep) | Spectral FFT band sweep and comb filter | Aurora | MIT |

---

### 15. Sequencer / Arpeggiator

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| Sequencer | [DaisyExamples/patch/Sequencer](https://github.com/electro-smith/DaisyExamples/tree/master/patch/Sequencer) | Step sequencer | Patch | MIT |
| Jellybeans | [EvansUniverse/daisy-projects](https://github.com/EvansUniverse/daisy-projects) | Diatonic quantizing arpeggiator *(needs update)* | Patch | Unknown |
| lx-euclid-001 | [lucblender/lx-euclid-001](https://github.com/lucblender/lx-euclid-001) | Euclidean rhythm generator *(needs update)* | Seed | Unknown |
| duopulse | [chronick/duopulse](https://github.com/chronick/duopulse) | Two-channel Eurorack sequencer | Patch.Init() | Unknown |
| Genome | [ModularDevicesMalleableAudio/Genome](https://github.com/ModularDevicesMalleableAudio/Genome) | Genetic algorithm CV/gate sequencer | Patch.Init() | Unknown |
| BoredSequence | [bakerbass/BoredSequence](https://github.com/bakerbass/BoredSequence) | 8-step CV sequencer | Field | Unknown |
| Heavy MIDI Seq | [bbparasite/Heavy-Midi-Sequencer](https://github.com/bbparasite/Heavy-Midi-Sequencer) | MIDI sequencer from .mid files (PlugData) | Seed | Unknown |

---

### 16. Vocoder / Pitch / Harmonizer

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| vocodr | [dbusteed/vocodr](https://github.com/dbusteed/vocodr) | Channel vocoder | Seed | Unknown |
| Multiplier | [Synthux Academy](https://www.synthux.academy/project/multiplier) | 3-voice harmonizer/pitch shifter | Seed | Unknown |
| Ethereal | [rljonesiii/ethereal](https://github.com/rljonesiii/ethereal) | Zero-latency multi-scale guitar harmonizer | Seed | Unknown |
| DaisyRotary | [pianomanfrazier/DaisyRotary](https://github.com/pianomanfrazier/DaisyRotary) | Leslie rotary speaker emulation | Seed | Unknown |
| terrarium-pitch-shifter | [fxwiegand/terrarium-pitch-shifter](https://github.com/fxwiegand/terrarium-pitch-shifter) | Pitch shifter for Terrarium *(needs update)* | Terrarium | Unknown |
| sammy (SAM) | [ulmert/sammy](https://github.com/ulmert/sammy) | Software Automatic Mouth speech synthesis | Patch | Unknown |

---

### 17. Utility / CV / Modulation

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| Musubi | [EvansUniverse/daisy-projects](https://github.com/EvansUniverse/daisy-projects) | Oscillator processing swiss army knife *(needs update)* | Patch | Unknown |
| Omakase | [EvansUniverse/daisy-projects](https://github.com/EvansUniverse/daisy-projects) | 4-channel stereo performance mixer *(needs update)* | Patch | Unknown |
| Skipmin | [nnirror/daisy_patches](https://github.com/nnirror/daisy_patches) | CV gate skipper (Max/gen~) | Patch | Unknown |
| Clock Modulator | [nnirror/daisy_patches](https://github.com/nnirror/daisy_patches) | 4-channel clock divider with CV | Patch | Unknown |
| Simple_Daisy_Oscilloscope | [kreiff/Simple_Daisy_Oscilloscope](https://github.com/kreiff/Simple_Daisy_Oscilloscope) | Rudimentary oscilloscope | Seed | Unknown |
| daisy-midside | [h2g2guy/daisy-midside](https://github.com/h2g2guy/daisy-midside) | Mid/side stereo processor *(needs update)* | Patch | Unknown |
| Midi2CV | [alexiszbik/Midi2CVModule](https://github.com/alexiszbik/Midi2CVModule) | MIDI to CV converter | Patch SM | Unknown |
| OscillatorModule | [alexiszbik/OscillatorModule](https://github.com/alexiszbik/OscillatorModule) | Oscillator module | Patch SM | Unknown |
| chnl | [olicarter/chnl](https://github.com/olicarter/chnl) | Eurorack channel strip | Patch SM | Unknown |
| USB Audio Interface | [leejarcher/Daisy-USB-Audio-Interface](https://github.com/leejarcher/Daisy-USB-Audio-Interface) | USB audio interface | Seed | Unknown |

---

### 18. Guitar Pedal Platforms

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| DaisySeedProjects (GuitarML) | [GuitarML/DaisySeedProjects](https://github.com/GuitarML/DaisySeedProjects) | Fork adding neural amp modeling (archived) | Seed | MIT |
| PedalBoi | [elijah-rou/PedalBoi](https://github.com/elijah-rou/PedalBoi) | Fully programmable guitar pedal | Seed | Unknown |
| PENDA | [DADDesign-Projects/PENDA-Software](https://github.com/DADDesign-Projects/PENDA-Software) | Stompbox platform with TFT display | Seed | Unknown |
| PENDAII | [DADDesign-Projects/PENDAII-Software](https://github.com/DADDesign-Projects/PENDAII-Software) | 2nd gen effects pedal platform | Seed | Unknown |
| Earth | [GuitarML/Earth](https://github.com/GuitarML/Earth) | Plate reverb + octave for FunBox (bin available) | FunBox | Unknown |
| Flick | [joulupukki/Flick](https://github.com/joulupukki/Flick) | Reverb/tremolo/delay for FunBox/Hothouse *(needs update)* | FunBox/Hothouse | Unknown |
| funbox-experiments | [crocidb/funbox-experiments](https://github.com/crocidb/funbox-experiments) | Audio effects for custom FunBox pedal | FunBox | Unknown |
| kalpa | [hotguac/kalpa](https://github.com/hotguac/kalpa) | Distortion pedal for Hothouse | Hothouse | Unknown |
| 1073_Daisy | [JackieAlacrity2373/1073_Daisy](https://github.com/JackieAlacrity2373/1073_Daisy) | Neve 1073-style EQ/preamp with vintage saturation | Seed | Unknown |
| DaisyPlatform | [olivergardiner/DaisyPlatform](https://github.com/olivergardiner/DaisyPlatform) | Stereo digital effects platform | Seed | Unknown |
| DaisyKlon | [jaffco/DaisyKlon](https://github.com/jaffco/DaisyKlon) | Klon Centaur overdrive emulation | Seed | Unknown |
| terrarium-ladder-filter | [fxwiegand/terrarium-ladder-filter](https://github.com/fxwiegand/terrarium-ladder-filter) | Ladder filter for Terrarium (bin available) | Terrarium | Unknown |
| guitarEffects | [varlogtim/guitarEffects](https://github.com/varlogtim/guitarEffects) | Guitar effects collection for Terrarium | Terrarium | Unknown |
| GyroBass | [vitonol/GyroBass](https://github.com/vitonol/GyroBass) | Motion-controlled bass guitar effects | Seed | Unknown |
| Senior-Project-DSP | [Jack-Hannon/Senior-Project-DSP](https://github.com/Jack-Hannon/Senior-Project-DSP) | Filter, phaser, flanger, delay, reverb | Seed | Unknown |
| HSP_Protoseed | [Harold-Street-Pedal-Company/HSP_Protoseed](https://github.com/Harold-Street-Pedal-Company/HSP_Protoseed) | Arduino library for quick pedal prototyping | Seed | Unknown |
| hothouse (andyhunti) | [andyhunti/hothouse](https://github.com/andyhunti/hothouse) | Audio projects for Hothouse platform | Hothouse | Unknown |
| How-to-Make-a-Guitar-Pedal | [skngh/How-to-Make-a-Guitar-Pedal](https://github.com/skngh/How-to-Make-a-Guitar-Pedal) | YouTube course: build a digital guitar pedal | Seed | Unknown |
| ChorusPetal | [danstronoid/ChorusPetal](https://github.com/danstronoid/ChorusPetal) | Chorus echo pedal for Terrarium | Terrarium | Unknown |
| terrarium-synth | [schult/terrarium-synth](https://github.com/schult/terrarium-synth) | Monophonic pitch-tracking synth pedal (bin available) | Terrarium | MIT |

---

### 19. Custom Eurorack Hardware (Daisy-based)

| Project | URL | Description | License |
|---------|-----|-------------|---------|
| kxmx_bluemchen | [recursinging/kxmx_bluemchen](https://github.com/recursinging/kxmx_bluemchen) | Open-source 4HP DSP module | MIT (SW) / CC-BY-NC-SA (HW) |
| eurorack-blocks | [ohmtech-rdi/eurorack-blocks](https://github.com/ohmtech-rdi/eurorack-blocks) | Software-to-hardware framework (C++/Max/Faust) | MIT |
| Loewenzahnhonig | [wgd-modular/loewenzahnhonig-firmware](https://github.com/wgd-modular/loewenzahnhonig-firmware) | Multi-firmware Eurorack module *(needs update)* | Unknown |
| Veno-Echo | [AdamFulford/Veno-Echo](https://github.com/AdamFulford/Veno-Echo) | Stereo delay Eurorack module | Unknown |
| simple_canvas | [lucblender/simple_canvas](https://github.com/lucblender/simple_canvas) | Buchla Easel-inspired west coast synth *(needs update)* | Unknown |
| gritwave eurorack | [gritwave/eurorack](https://github.com/gritwave/eurorack) | 5-module suite: amp sim, FX, dynamics, wavetable, noise (bins available) | MIT |
| Rawyaw Media | [rawyawmedia/eurorack](https://github.com/rawyawmedia/eurorack) | Dizygote, Monolith, Torus modules (firmware bins only) | Unknown |

---

### 20. Patch.Init() Specific

| Project | URL | Description | License |
|---------|-----|-------------|---------|
| PatchInit_Collection | [benjiaomodular/PatchInit_Collection](https://github.com/benjiaomodular/PatchInit_Collection) | DaisyDuino examples: oscillator, kick, pluck, strings | Unknown |
| Working patches (hvcc) | [edition1304/working-patches-for-patch.Init-hvcc-](https://github.com/edition1304/working-patches-for-patch.Init-hvcc-) | PureData patches compiled via hvcc | Unknown |
| Flora (blackboxaudio) | [blackboxaudio/flora](https://github.com/blackboxaudio/flora) | Lotus, Kudzu, Lily instruments *(needs update)* | Unknown |
| ProteusDaisyPatchInit | [abluenautilus/ProteusDaisyPatchInit](https://github.com/abluenautilus/ProteusDaisyPatchInit) | Proteus generative sequencer (native C++ port) | Unknown |
| Experosynth | [remixed123/Experosynth](https://github.com/remixed123/Experosynth) | Experimental synth with triple VCO and gate outs | Unknown |

---

### 21. Drum Machines

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| BassMate | [ukmaker/BassMate](https://github.com/ukmaker/BassMate) | 4-channel drum machine for rhythm backing *(needs update)* | Seed | Unknown |
| Stray Drum Versio | [jasmineandolivetrees.com](https://jasmineandolivetrees.com/pages/stray-drum-versio-firmware) | Drum synthesis firmware | Versio | Unknown |
| daisy-hachikit | [perkowitz/daisy-hachikit](https://github.com/perkowitz/daisy-hachikit) | Virtual modular drum kit *(needs update)* | Patch | Unknown |
| groovydaisy | [nodnid/groovydaisy](https://github.com/nodnid/groovydaisy) | Groovebox | Pod | Unknown |
| KarplusStrongMachine | [willbearfruits/KarplusStrongMachine](https://github.com/willbearfruits/KarplusStrongMachine) | Digital kalimba with WebUSB (bin available) | Seed | Unknown |

---

### 22. Max/MSP gen~ Projects

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| daisy_patches | [nnirror/daisy_patches](https://github.com/nnirror/daisy_patches) | gen~ patches: gate skipper, clock divider | Patch | Unknown |
| Oopsy (tool) | [electro-smith/oopsy](https://github.com/electro-smith/oopsy) | gen~ to Daisy compiler/flasher | All | MIT |
| max-msp-gen-plugins | [jeremywinters/max-msp-gen-plugins](https://github.com/jeremywinters/max-msp-gen-plugins) | Gen~ plugins for Patch and Mod Duo X | Patch | Unknown |
| oopsy_projects | [simontho/oopsy_projects](https://github.com/simontho/oopsy_projects) | Max patches for Oopsy/Daisy Patch | Patch | Unknown |

---

### 23. Pure Data / Plugdata Projects

| Project | URL | Description | Hardware | License |
|---------|-----|-------------|----------|---------|
| pd2dsy (tool) | [electro-smith/pd2dsy](https://github.com/electro-smith/pd2dsy) | PD Vanilla to Daisy converter (archived) | All | MIT |
| hvcc (tool) | [Wasted-Audio/hvcc](https://github.com/Wasted-Audio/hvcc) | Heavy Compiler Collection for PD patches | All | MIT |
| olm-pd | [MaxKablaam/olm-pd](https://github.com/MaxKablaam/olm-pd) | PD patches for battery-powered standalone synth | Seed | Unknown |
| Skykys2Daisy | [skykys88/Skykys2Daisy](https://github.com/skykys88/Skykys2Daisy) | PD patches for Patch Submodule | Patch SM | Unknown |

---

### 24. Development Tools & Frameworks

| Project | URL | Description | License |
|---------|-----|-------------|---------|
| DaisySP | [electro-smith/DaisySP](https://github.com/electro-smith/DaisySP) | Core DSP library (oscillators, filters, reverb, delay, etc.) | MIT |
| libDaisy | [electro-smith/libDaisy](https://github.com/electro-smith/libDaisy) | Hardware abstraction layer | MIT |
| DaisyDuino | [electro-smith/DaisyDuino](https://github.com/electro-smith/DaisyDuino) | Arduino support | MIT |
| daisy (Rust) | [zlosynth/daisy](https://github.com/zlosynth/daisy) | Rust HAL for Daisy | Unknown |
| daisy_bsp (Rust) | [antoinevg/daisy_bsp](https://github.com/antoinevg/daisy_bsp) | Rust BSP (no_std, embedded_hal) | MIT |
| libdaisy-rust | [mtthw-meyer/libdaisy-rust](https://github.com/mtthw-meyer/libdaisy-rust) | Rust HAL implementation | MIT |
| daisy-embassy (Rust) | [crates.io](https://crates.io/crates/daisy-embassy) | Async Rust with Embassy framework | Unknown |
| brickworks | [Orastron/brickworks](https://github.com/Orastron/brickworks) | Cross-platform music DSP toolkit | Unknown |
| DaisyPatchBoilerplate | [SwampFlux/DaisyPatchBoilerplate](https://github.com/SwampFlux/DaisyPatchBoilerplate) | Patch project template | Unknown |
| DaisySP-LGPL | [electro-smith/DaisySP-LGPL](https://github.com/electro-smith/DaisySP-LGPL) | DSP modules from Csound (LGPL) | LGPL |
| json2daisy | [electro-smith/json2daisy](https://github.com/electro-smith/json2daisy) | JSON board defs to C++ board support files | MIT |
| PedalDevKit-Example | [electro-smith/PedalDevKit-Example](https://github.com/electro-smith/PedalDevKit-Example) | Seed2 DFM pedal eval kit template (bin available) | Unknown |
| Daisy-Juce-Example | [electro-smith/Daisy-Juce-Example](https://github.com/electro-smith/Daisy-Juce-Example) | JUCE + DaisySP audio plugin example | Unknown |
| Nimphea | [Brokezawa/Nimphea](https://github.com/Brokezawa/Nimphea) | Nim wrapper for libDaisy (bin available) | Unknown |
| daisysp_nim | [Brokezawa/daisysp_nim](https://github.com/Brokezawa/daisysp_nim) | Nim wrapper for DaisySP | Unknown |
| DAFX_2_Daisy_lib | [Denys/DAFX_2_Daisy_lib](https://github.com/Denys/DAFX_2_Daisy_lib) | DAFX textbook MATLAB algorithms ported to DaisySP | Unknown |
| DaisySeedCubeTemplate | [DADDesign-Projects/DaisySeedCubeTemplate](https://github.com/DADDesign-Projects/DaisySeedCubeTemplate) | STM32CubeIDE framework (audio, SDRAM, QSPI) | Unknown |
| Daisy_QSPI_Flasher | [DADDesign-Projects/Daisy_QSPI_Flasher](https://github.com/DADDesign-Projects/Daisy_QSPI_Flasher) | QSPI remote loader flasher utility | Unknown |
| DaisySeedGFX2 | [DADDesign-Projects/DaisySeedGFX2](https://github.com/DADDesign-Projects/DaisySeedGFX2) | Graphics library for ST7789/ST7735 TFTs | Unknown |
| Daisy_SSD1327 | [TurpinL/Daisy_SSD1327](https://github.com/TurpinL/Daisy_SSD1327) | SSD1327 grayscale OLED display driver | Unknown |
| DaisySP_Teensy | [rheslip/DaisySP_Teensy](https://github.com/rheslip/DaisySP_Teensy) | DaisySP ported to Teensy 4 | Unknown |
| KModular | [kenjib2/KModular](https://github.com/kenjib2/KModular) | Modular synth library for Daisy | Unknown |
| WasmPatcher | [jaffco/WasmPatcher](https://github.com/jaffco/WasmPatcher) | DaisySP modules in browser via WebAssembly | Unknown |
| simple-touch-instruments | [Synthux-Academy/simple-touch-instruments](https://github.com/Synthux-Academy/simple-touch-instruments) | Touch instrument firmware | Unknown |
| simple-fix-instruments | [Synthux-Academy/simple-fix-instruments](https://github.com/Synthux-Academy/simple-fix-instruments) | Simple Fix board instrument firmware | Unknown |
| daisy_seed_tdm | [heartwerktech/daisy_seed_tdm_eurorack_pmod](https://github.com/heartwerktech/daisy_seed_tdm_eurorack_pmod) | TDM codec support for Eurorack PMOD | Unknown |

---

## Building from Source

### Prerequisites

```bash
# Install ARM toolchain
sudo apt install gcc-arm-none-eabi

# Or on macOS
brew install arm-none-eabi-gcc
```

### Build all projects

```bash
# Clone this repo
git clone https://github.com/Ziforge/daisy-patch-algos.git
cd daisy-patch-algos

# Build everything (requires arm-none-eabi-gcc)
./scripts/build_all.sh

# Build a specific project
./scripts/build_project.sh DaisyCloudSeed
```

### CI/CD

This repo uses GitHub Actions to automatically:
1. Clone each source repository listed in `projects.json`
2. Build against a pinned libDaisy/DaisySP version
3. Publish `.bin` files as GitHub Releases

See `.github/workflows/build.yml` for details.

---

## Contributing

Found a Daisy firmware project not listed here? Open a PR adding it to `projects.json`:

```json
{
  "name": "YourProject",
  "repo": "https://github.com/user/repo",
  "description": "What it does",
  "category": "reverb",
  "hardware": ["patch"],
  "license": "MIT",
  "build_dir": ".",
  "build_target": "YourProject"
}
```

---

## Key Resources

- [Electro-Smith Forum - Projects & Examples](https://forum.electro-smith.com/c/projects-and-examples/18)
- [GitHub topic: daisy-seed](https://github.com/topics/daisy-seed)
- [GitHub topic: electrosmith-daisy](https://github.com/topics/electrosmith-daisy)
- [Noise Engineering Firmware Index](https://github.com/Maxhodges/noise-engineering-firmware-index)
- [GuitarML Pedals](https://guitarml.com/pedals.html)
- [Daisy Web Programmer](https://electro-smith.github.io/Programmer/)
- [Awesome Eurorack Modular Resources](https://github.com/landscape82/awesome-eurorack-modular-resources)

## Disclaimer & Takedown Policy

This repository is an **educational index and build aggregator**. It does not claim ownership of any listed project.

- **All intellectual property belongs to the original authors.** Each project entry links to its original source repository.
- **All original licenses are in effect.** The license column in the catalog reflects the license found in each project's source repository at the time of cataloging. When a license is listed as "Unknown", users must check the original repo before any use beyond personal learning.
- **No warranty.** Pre-built binaries are provided as-is for educational convenience. For production use, always build from the original source.
- **Takedown requests are honored immediately.** If you are the author or rights holder of any project listed here and would like it removed from this catalog or from the automated builds, please [open an issue](../../issues) or contact us directly. We will remove it promptly, no questions asked.

## License

This repository's own files (catalog text, build scripts, CI configuration) are MIT licensed. **This does not extend to the individual firmware projects cataloged here** — each retains its own license as noted above. Always check and comply with the original project's license before any use, modification, or redistribution.
