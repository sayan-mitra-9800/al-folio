---
layout: distill
title: Why tablas are actually guitars
description: How to achieve harmonic percussions
tags: music
categories: science
featured: false
disqus_comments: true
related_posts: false
show_reading_time: true

bibliography: 2024-05-12-harmonic.bib

toc:
  - name: What is a tabla
    # if a section has subsections, you can add them as follows:
    # subsections:
    #   - name: Example Child Subsection 1
    #   - name: Example Child Subsection 2
  - name: Sound
  - name: String Instruments
  - name: Harmonics
  - name: Percussion Instruments
  - name: Tabla

# Below is an example of injecting additional post-specific styles.
# If you use this post as a template, delete this _styles block.
_styles: >
  .move-up {
      margin-top: -25px;  // Adjusts the space by moving the div up
  }
---
## What is a tabla
Listen to these two instruments -
<div class = "move-up">
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include audio.html path="assets/audio/TablaSound.mp3" controls=true %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include audio.html path="assets/audio/DrumsSound.mp3" controls=true %}
    </div>
</div>
</div>
The first instrument is a tabla - an Indian percussion instrument and the second instrument is of course the western drum.
Tablas are able to produce a sustained **harmonic** sound. This is fundamentally different from the sounds produced by western percussion instruments that generally tend to produce quick beats in succession.
The design of the tabla however, does not seem to suggest any _special_ capabilities that would make it stand out. How then is the tabla able to produce a sustained harmonic tone, like string instruments?
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/ManPlayingTabla.jpg" class="img-fluid rounded z-depth-1" zoomable=true %}
    </div>
</div>

## Sound
But what actually **is** sound? (_vsauce music_)

We have learnt (possibly in school) that sounds are pressure waves.
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/SoundWave.png" class="img-fluid rounded z-depth-1" zoomable=true %}
    </div>
</div>
These pressure waves cause our eardrums to vibrate at a particular frequency, that your brain interprets as a sound.
The origin of these pressure waves are a vibrating source, be it the strings of a guitar, the membrane of your vocal chord or a diaphragm of a digital speaker. The source itself vibrates as [standing waves](https://en.wikipedia.org/wiki/Standing_wave) that arise as a solution to the wave differential equation applied to the source.

$$
\nabla^2u = \frac{1}{v^2}\frac{\partial^2u}{\partial t^2}
$$

<div class="caption">
The general wave equation, $u$ is the displacement, $t$ is time and $v$ is the speed of the wave
</div>

## String Instruments
The case of string instruments are particularly easy to solve as we only have to worry about the wave propagation in one dimension.
The standing wave solution comes out to be -

$$
u(x,t) = 2u_{\max}\sin(\frac{2\pi x}{\lambda})\cos(2\pi f t)
$$

<div class="caption">
$\lambda$ is the wavelength, $f$ is the frequency of vibration and $\lambda f = v$
</div>
Now if you assume that the string has length $$L$$ and is clamped on either ends you get a boundary condition that imposes a condition on $$\lambda$$ and thus $$f$$.

$$
f = \frac{nv}{2L}
$$

<div class="caption">
Condition imposed on the frequency of a string, where $n$ is an integer
</div>
Now for $$n = {1, 2, ..}$$ we get valid solutions for the standing wave equation. The $$n = 1$$ frequency is the **fundamental frequency** and $$n = 2, 3, ..$$ are the overtones. Generally, the fundamental frequency is the loudest that can be heard. The fundamental frequency of string instruments can be set by adjusting the thickness of the string and how tight it is. The equation for $$v$$ is $$v = \sqrt{\frac{T}{\mu}}$$ where $$T$$ is the tension in the string and $$\mu$$ is the linear mass density. <d-footnote><a href = "https://pressbooks.online.ucf.edu/osuniversityphysics/chapter/16-3-wave-speed-on-a-stretched-string/#:~:text=The%20speed%20of%20a%20pulse%20or%20wave%20on,is%20the%20mass%20per%20length%20of%20the%20string.">Derivation for speed of wave in a string</a></d-footnote>
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/Standing_waves_on_a_string.gif" class="img-fluid rounded z-depth-1" zoomable=true %}
    </div>
</div>
<div class = "move-up">
  <div class="caption">
  First six (of the infinte) solutions to the vibrations of a string
  </div>
</div>

## Harmonics
When an instrument produces frequencies that are integer multiples of the fundamental, the sound is thus harmonic.
Musical instruments like the guitar are harmonic as they are string instruments. Notice how the wave equation is a linear equation, which means that if $$u_1$$ and $$u_2$$ are valid solutions then $$a u_1 + b u_2$$ is also a valid solution. That means the actual solution for a string instrument is an infinite sum for all the harmonic frequencies with different amplitudes. The relative amplitudes of the overtones are what enable us to distinguish between different instruments. This is what we refer to as **timbre**.

## Percussion Instruments
The sounds produced by a percussion instrument comes from a vibrating membrane. If we assume the membrane to have uniform thickness we can attempt to solve the wave equation in **cylindrical coordinates**. Using the Laplacian we get -

$$
\frac{\partial^2 u}{\partial r^2} + \frac{1}{r} \frac{\partial u}{\partial r} + \frac{1}{r^2} \frac{\partial^2 u}{\partial \theta^2} = \frac{1}{v^2} \frac{\partial^2 u}{\partial t^2}
$$

Taking inspiration from the linear solution we can infer that $$v^2 = \frac{\tau}{\rho}$$, where $$\tau$$ is the tension per unit length and $$\rho$$ is the surface mass density ($$v$$ is the speed of the wave as discussed before).
Just like the linear case, if we assume that the surface mass density is constant (western drums) and apply the boundary condition that the rim of the instrument is stationary, then surprisingly we **do not** get integer multiple solutions to the fundamental frequency.
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/Drum_vibration_mode01.gif" class="img-fluid rounded z-depth-1" zoomable=true %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/Drum_vibration_mode11.gif" class="img-fluid rounded z-depth-1" zoomable=true %}
    </div>
</div>
<div class = "move-up">
  <div class="caption">
  Two modes of vibration of a percussion instrument
  </div>
</div>
What we end up getting is that the allowed frequencies are in the ratio of the **zeros of the Bessel functions**<d-cite key="STabla"></d-cite>. The zeros of the Bessel functions are not integer numbers and hence we get that western drums **can not produce harmonics sounds**.<d-footnote>Please note that this is not comparing western drums to tablas. They both serve different purposes.</d-footnote>

## Tabla
How then are tablas able to produce a harmonic sound? Well the answer lies on the membrane of the tabla.
<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/TablaImage.jpg" class="img-fluid rounded z-depth-1" zoomable=true %}
    </div>
</div>
Notice a black circle on the membrane called the _Syahi_. The _Syahi_ is not just a design on the membrane but serves a crucial purpose. It is made with a mixture of flour, water and iron filings. This means that it carries a **non negligible mass** that does not cover the entire surface. This makes the surface mass density **non uniform** that changes the solution to the wave equation in cylindrical coordinates.
The solution to such an equation is quite complicated and thus a computational solution is required.
When accounted for the non uniformity of the _Syahi_ the overtone frequencies are found to be integer multiples of the fundamental, thus making it **harmonic like a guitar**.

Sir C. V. Raman was the first to notice and publish<d-cite key="CVR"></d-cite> this phenomenon in 'Proceeding of Indian Academy of Sciences' in 1934.
